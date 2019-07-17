def bubble_sort(array)
    sorted = false

    while sorted == false
        i = 0
        k = 0
        swap = false
        while i < (array.length - 1) - k
            a = array[i]
            b = array[i+1]
            puts "comparing #{a} and #{b}"
            if a > b
                array[i] = b
                array[i+1] = a
                swap = true
                k += 1
            end
            puts "new order: #{array}"
            i += 1
        end
        if swap == false
            sorted = true
        end
    end

    puts array
end

bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(array)
    sorted = false

    while sorted == false
        i = 0
        k = 0
        swap = false
        while i < array.length - (k + 1)
            left = array[i]
            right = array[i+1]
            if yield(left, right) > 0
                array[i] = right
                array[i+1] = left
                k += 1
                swap = true
            end
            i += 1
        end
        if swap == false
            sorted = true
        end
    end

    puts array
end

bubble_sort_by(["hi","hello","hey"]) do |left, right|
    left.length - right.length
end