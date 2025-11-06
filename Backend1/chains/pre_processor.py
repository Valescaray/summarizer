# chains/pre_processor.py
from utils.cleaner import clean_text
from utils.text_chunker import chunk_text
from langchain_core.runnables import Runnable, RunnableConfig
from dotenv import load_dotenv

load_dotenv()

def clean_and_split_text(*, input_data, chunk_size=1000, chunk_overlap=200):
    """
    Cleans and splits text into smaller chunks.
    Supports both raw text (string) and dict input (e.g. {"text": "..."}).
    """
    print(f"\n🧾 DEBUG: input_data type = {type(input_data)}, chunk_size = {chunk_size}\n")

    # 🧩 Handle both dict and string inputs
    if isinstance(input_data, dict):
        text = input_data.get("text", "")
    else:
        text = input_data

    # 1️⃣ Clean the text
    cleaned = clean_text(text)

    # 2️⃣ Convert chunk_size safely
    try:
        chunk_size = int(chunk_size)
    except ValueError:
        print("🚨 chunk_size was not numeric, defaulting to 1000")
        chunk_size = 1000

    # 3️⃣ Split if too short
    if len(cleaned) <= chunk_size:
        return [cleaned]

    # 4️⃣ Use RecursiveCharacterTextSplitter
    chunks = chunk_text(cleaned, chunk_size=chunk_size, chunk_overlap=chunk_overlap)
    return chunks


class PreprocessingChain(Runnable):
    def __init__(self, chunk_size=1000, chunk_overlap=200):
        self.chunk_size = chunk_size
        self.chunk_overlap = chunk_overlap

    def invoke(self, input_data, config: RunnableConfig = None):
        """Ensure consistent preprocessing regardless of input format."""
        return clean_and_split_text(
            input_data=input_data, 
            chunk_size=self.chunk_size,
            chunk_overlap=self.chunk_overlap
        )


# ✅ Example initialization (safe)
pre_chain = PreprocessingChain(chunk_size=100, chunk_overlap=20)




