# chains/combined_chain.py
from chains.pre_processor import PreprocessingChain 
from chains.summarization import summarizer_chain
from chains.post_processor import postprocessor_chain
from langchain_core.runnables import RunnableBranch



# For simplicity, assume input is short (not chunked)
combined_chain = PreprocessingChain | summarizer_chain | postprocessor_chain
