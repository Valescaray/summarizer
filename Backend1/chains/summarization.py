# chains/summarizer_chain.py
from langchain_core.prompts import PromptTemplate
from langchain_core.output_parsers import StrOutputParser
from config import get_llm

import os

# Get the directory of this file
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# Construct the absolute path to the prompt file
prompt_path = os.path.join(BASE_DIR, "../prompts/summarization_prompt.txt")

with open(prompt_path, "r", encoding="utf-8") as f:
    prompt_text = f.read()


prompt = PromptTemplate.from_template(prompt_text)
llm = get_llm()
parser = StrOutputParser()

summarizer_chain = prompt | llm | parser
