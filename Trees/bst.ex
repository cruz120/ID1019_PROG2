defmodule BST do

# bst :: {key,bst,bst} | nil

   #new(key) :: bst
   def new(v) do %{value: v, left: nil, right: nil} end


   #insert(bst,key) :: bst
   def insert(nil,new_value) do new(new_value) end

   def insert(%{value: v,left: left,right: right},new_value) do

      if new_value <= v do
             %{value: v,left: insert(left,new_value),right: right}
      else
              %{value: v,left: left,right: insert(right,new_value)}
      end
   end


   #lookup(bst,key) :: boolean
   def lookup(nil,_) do false end
   def lookup(%{value: v,left: left,right: right},key) do
       cond do
         v == key -> true
         key < v  -> lookup(left,key)
         key > v  -> lookup(right,key)
       end
   end


 #delete(bst,key) :: bst
 def delete(nil,_) do nil end
 def delete(%{value: v,left: left,right: right},key) do
   cond do
     v == key -> remove_node(%{value: v,left: left,right: right})
     key < v  -> %{value: v, left: delete(left,key),right: right}
     key > v  -> %{value: v,left: left, right: delete(right,key)}
   end
 end

 #remove_node(bst) :: bst | nil
 def remove_node(%{value: _,left: nil,right: nil}) do nil end
 def remove_node(%{value: _, left: nil, right: right}) do right end
 def remove_node(%{value: _, left: left, right: nil}) do left end
 def remove_node(%{value: v, left: left, right: right}) do

  min = minimum_val(right,v)
  %{value: min, left: left, right: delete(right,min)}
 end

 #minimum_val(bst,key) :: integer
 def minimum_val(%{value: v, left: nil, right: _},_) do v end
 def minimum_val(%{value: v, left: left, right: _},key) do
     if v > key do
        minimum_val(left,key)
     end
  end

    #sum(bst) :: integer
    def sum(nil) do 0 end

    def sum(%{value: v,left: left,right: right}) do
      v + sum(left) + sum(right)
    end

    #mirror(bst) :: bst
    def mirror(nil) do nil end

    def mirror(%{value: v,left: left,right: right}) do

      %{value: v,left: mirror(right),right: mirror(left)}

    end
end
