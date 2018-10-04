require './camera'

sony_black_camera = Camera.new("Sony", "Black")
sony_silver_camera = Camera.new("Sony", "Silver")
canon_black_camera = Camera.new("Canon", "Black")

puts sony_black_camera <=> canon_black_camera
# puts sony_black_camera < canon_black_camera

def sort(*args)
  sorted = false
  until sorted
    args_duplicate = args.dup
    n = args.length
    (n-1).times do |i|
      if args[i+1] < args[i]
        args[i], args[i+1] = args[i+1], args[i]
      end
    end
    sorted = true if args_duplicate == args
  end
  args
end

sorted = [canon_black_camera, sony_silver_camera, sony_black_camera]

maybe_sorted = sort(sony_black_camera, canon_black_camera, sony_silver_camera)
puts maybe_sorted == sorted
