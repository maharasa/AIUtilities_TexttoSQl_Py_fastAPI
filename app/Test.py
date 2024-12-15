# import ollama

# #print("fdsfadfkasfk")
# r = ollama.generate(
#     model='duckdb-nsql',
#     system='''Here is the database schema that the SQL query will run on:
# CREATE TABLE taxi (
#     VendorID bigint,
#     tpep_pickup_datetime timestamp,
#     tpep_dropoff_datetime timestamp,
#     passenger_count double,
#     trip_distance double,
#     fare_amount double,
#     extra double,
#     tip_amount double,
#     tolls_amount double,
#     improvement_surcharge double,
#     total_amount double,
# );''',
#     prompt='get all columns ending with _amount from taxi table',
# )
# #print(r)
# print(r['response'])
# import torch  # Import torch
# from transformers import AutoTokenizer, AutoModelForCausalLM

# # Specify the model name
# model_name = "motherduckdb/DuckDB-NSQL-7B-v0.1"

# # Download and save the tokenizer and model
# tokenizer = AutoTokenizer.from_pretrained(model_name)
# tokenizer.save_pretrained("./DuckDB-NSQL-Model")

# model = AutoModelForCausalLM.from_pretrained(model_name, torch_dtype=torch.bfloat16)
# model.save_pretrained("./DuckDB-NSQL-Model")

# print("Model and tokenizer saved locally in the folder: ./DuckDB-NSQL-Model")

import torch
from transformers import AutoTokenizer, AutoModelForCausalLM
print("testing")
tokenizer = AutoTokenizer.from_pretrained("motherduckdb/DuckDB-NSQL-7B-v0.1")
model = AutoModelForCausalLM.from_pretrained("motherduckdb/DuckDB-NSQL-7B-v0.1", torch_dtype=torch.bfloat16)

text = """### Instruction:
Your task is to generate valid duckdb SQL to answer the following question, given a duckdb database schema.

### Input:
Here is the database schema that the SQL query will run on:
CREATE TABLE taxi (
    VendorID bigint,
    tpep_pickup_datetime timestamp,
    tpep_dropoff_datetime timestamp,
    passenger_count double,
    trip_distance double,
    fare_amount double,
    extra double,
    tip_amount double,
    tolls_amount double,
    improvement_surcharge double,
    total_amount double,
);

### Question:
get all columns ending with _amount from taxi table

### Response (use duckdb shorthand if possible):"""

input_ids = tokenizer(text, return_tensors="pt").input_ids

generated_ids = model.generate(input_ids, max_length=500)
print(tokenizer.decode(generated_ids[0], skip_special_tokens=True))
