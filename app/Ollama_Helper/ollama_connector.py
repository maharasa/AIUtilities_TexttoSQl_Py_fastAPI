import ollama

from pydantic import BaseModel

class OllamaInput(BaseModel):
    prompt: str
    modelname: str

def GetAnswer(input:OllamaInput):
    try:
        r = ollama.generate(
        model='duckdb-nsql',
        system=input.prompt,
        prompt='get all columns ending with _amount from taxi table',
        )
        # ollama.generate(model='llama3.2:latest',
        # prompt='what is a qubit?')
        # print(response['response'])
        # responce= ollama.generate(model=input.modelname,messages=[{
        #  "role": "user", 
        #  "content": input.prompt
        #  }])
        
        return r['response']
        
    except Exception as e:
         return f"Error: {e}, Status Code: {e.status_code}"
    


    