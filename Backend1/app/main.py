# main.py
from chains.combined_chains import combined_chain
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware

# If you have a paraphraser chain too, import it here
# from chains.paraphraser_chain import paraphraser_chain

app = FastAPI()

# Allow frontend to call backend from localhost:5173 or 3000
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # or ["http://localhost:5173"]
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Input schema
class TextRequest(BaseModel):
    text: str
    mode: str  # "summarize" or "paraphrase"

@app.post("/process-text")
async def process_text(req: TextRequest):
    try:
        if req.mode == "summarize":
            result = combined_chain.invoke(req.text)
        elif req.mode == "paraphrase":
            # result = paraphraser_chain.invoke(req.text)
            result = "Paraphrasing chain not yet implemented"
        else:
            raise HTTPException(status_code=400, detail="Invalid mode")
        
        return {"output": result}
    
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


# if __name__ == "__main__":
#     sample_text = """
#     LangChain helps developers create applications powered by language models.
#     It simplifies building workflows that connect prompts, data, and logic together.
#     Developers use it for chatbots, summarizers, and AI assistants.
#     """

#     print("🔄 Running summarization pipeline...")
#     result = combined_chain.invoke(sample_text)
#     print("\n✅ Final Summary:\n", result)