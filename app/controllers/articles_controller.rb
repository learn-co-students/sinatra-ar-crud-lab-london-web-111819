class ArticlesController < ApplicationController

    # Index 
    get ("/articles/?") {
        @articles = Article.all
        erb :"articles/index"
    }

    # New Form
    get ("/articles/new") {
        erb :"articles/new"
    }

    #Show
    get ("/articles/:id"){
        id = params[:id]
        @article = Article.find(id)
        erb :"articles/show"
    }

    # Create
    post ("/articles") {
        # @article = Article.create(title: params[:title], content: params[:content])
        article = Article.create(params)
        redirect "/articles/#{article.id}"
    }
    
    #Edit Form
    get ("/articles/:id/edit"){
        id = params[:id]
        @article = Article.find(id)
        erb :"articles/edit"
    }

    #Update (via Patch or Put)
    patch ("/articles/:id"){
        id = params[:id]
        article = Article.find(id)
        article.title = params[:title]
        article.content = params[:content]
        article.save
        
        redirect "/articles/#{article.id}"
    }

    # put ("articles/:id"){

    # }

    #Destroy (via Delete)
    delete ("/articles/:id"){
        article = Article.find(params[:id])
        article.destroy
        redirect "/articles"
    }
end