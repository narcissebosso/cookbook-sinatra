         Prefix Verb   URI Pattern                     Controller#Action
    recipe GET    /recipe(.:format)          recipe#index
                POST   /recipe(.:format)          recipe#create
 new_recipe GET    /recipe/new(.:format)      recipe#new
edit_recipe GET    /recipe/:id/edit(.:format) recipe#edit
     recipe GET    /recipe/:id(.:format)      recipe#show
                PATCH  /recipe/:id(.:format)      recipe#update
                DELETE /recipe/:id(.:format)      recipe#destroy



Add _path to the route prefix (left column).
