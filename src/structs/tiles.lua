local tiles_struct = {}

function tiles_struct.convert_tile_string(tiles)
    local tiles = tiles:gsub("\r\n", "\n")
    local lines = tiles:split("\n")

    local cols = 0
    local rows = lines:len

    for i, line <- lines do
        cols = math.max(cols, #line)
    end

    local res = table.filled("0", {cols, rows})

    for y, line <- lines do
        local chars = $(line):split(1)()

        for x, char <- chars do
            res[x, y] = char
        end
    end

    return res
end

function tiles_struct.decode(data)
    local tiles = {
        _type = "tiles",
        _raw = data
    }

    tiles.matrix = tiles_struct.convert_tile_string(data.innerText or "")

    return tiles
end

function tiles_struct.encode(tiles)

end

return tiles_struct