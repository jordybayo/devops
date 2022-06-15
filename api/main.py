from typing import Optional
from fastapi import FastAPI, Body#
from pydantic import BaseModel


class Post(BaseModel):
    title: str
    content: str
    published: bool = True
    rating: Optional[int] = None

app = FastAPI()


@app.get("/")
def read_root():
    return {"hello": "world"}

@app.get("/post")
def root():
    return {"hello": "world2"}

@app.post("/createpost")
def create_post(post: Post):
    print(post.rating)
    print(post.dict())
    return {"post": "Nouveau Post"}