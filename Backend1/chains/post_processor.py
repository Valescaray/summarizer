# chains/postprocessor_chain.py
from langchain_core.runnables import RunnableLambda
from utils.cleaner import remove_prefix, clean_text

def postprocess_summary(summary: str) -> str:
    summary = remove_prefix(summary, "summary:")
    summary = clean_text(summary)
    return summary

postprocessor_chain = RunnableLambda(postprocess_summary)
