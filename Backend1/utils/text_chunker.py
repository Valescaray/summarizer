from langchain.text_splitter import RecursiveCharacterTextSplitter


def chunk_text(text: str, chunk_size: int = 1000, chunk_overlap: int = 200) -> list[str]:
    """Chunk text into smaller pieces using RecursiveCharacterTextSplitter."""
    splitter = RecursiveCharacterTextSplitter(
        chunk_size=chunk_size,
        chunk_overlap=chunk_overlap,
        length_function=len  # You can replace with a token counter if needed
    )
    return splitter.split_text(text)