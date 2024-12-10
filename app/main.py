from typing import Union
from fastapi import FastAPI
from app.Ollama_Helper.ollama_connector import GetAnswer, OllamaInput

app = FastAPI()


@app.get("/")
def read_root():
    return {"message": "Hello, World!"}

@app.post("/ollama/")
def read_item(input: OllamaInput):
    ans=GetAnswer(input)
    return ans

