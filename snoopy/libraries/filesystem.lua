local filesystem = {}

function filesystem.exists(path)
    return isfile(path) or isfolder(path)
end

function filesystem.read(path)
    return readfile(path)
end

function filesystem.write(path, data)
    writefile(path, data)
end

function filesystem.append(path, data)
    appendfile(path, data)
end

function filesystem.delete(path)
    if isfile(path) then
        delfile(path)
    elseif isfolder(path) then
        delfolder(path)
    end
end

return filesystem
