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