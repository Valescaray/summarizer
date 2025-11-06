# utils/cleaner.py
import re

def clean_text(text: str) -> str:
    """Remove excess whitespace, line breaks, and repeated spaces."""
    
    
  
        
    text = re.sub(r'\s+', ' ', text)
    return text.strip()

def remove_prefix(text: str, prefix: str) -> str:
    """Remove a specific prefix like 'Summary:' from model outputs."""
    if text.lower().startswith(prefix.lower()):
        return text[len(prefix):].strip()
    return text.strip()
