defmodule MAX_HEAP do


   def new(v) do {:heap,v,nil,nil} end

   def insert(nil,v) do new(v) end
   def insert({:heap,v,left,right},new_value) do
   if  v > new_value do
     {:heap,v,insert(right,new_value),left}
   else
      {:heap,new_value,insert(right,v),left}
   end
  end
end
