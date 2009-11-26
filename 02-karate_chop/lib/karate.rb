# IMPLEMENT A BINARY SEARCH
require 'benchmark'
class ChuckNorris
  def beard?
    true
  end
  
  def chop(target, source)

      return -1 if !source.include?(target)
      return 0 if source.size == 1
    
      source.each_with_index do |item, index|
        return index if item == target
      end
 
  end
end


class MartialArtist < ChuckNorris
  
  
  
  def chop_1(fist, faces)

    if(faces.empty?) then return -1 end
    if(faces.size == 1)
      return fist == faces.first ? 0 : -1 
    end
    @fist = fist
    @faces = faces
    something_else(0, @faces.size-1)

  end
  
  def something_else(start_index, end_index)
    return -1 if start_index == end_index && @faces[start_index] != @fist
    midpoint = start_index + ((end_index - start_index) / 2)
    if @faces[midpoint] == @fist
      return midpoint
    elsif @faces[midpoint] < @fist
      something_else(midpoint+1, end_index)
    else
      something_else(start_index, midpoint)
    end
  end
  
  def chop_2
    
    
    
  end 
  
end

