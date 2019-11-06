
class Application 
  @@items = []

  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last 
      item = @@items.find {|i| i.name == item_name}
      resp.write "#{item.price}"
    else 
      resp.status = 404
      resp.write "Route not found"
    end 
    
    
    
  resp.finish  
  end 
  
  
  
end 



# if req.path == "/items/"
#       item = req.params["item"]
#       if @@items.include?(item)
#         resp.write "#{item.price}"
#       else 
#         resp.write "error message"
#         resp.status = 400 
#       end 
#     else 
#       resp.write "Route not found"
#       resp.status = 404
#     end 
#     resp.finish  