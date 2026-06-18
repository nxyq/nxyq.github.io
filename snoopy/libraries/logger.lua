local logger = {}

local function stamp()
    return os.date("%H:%M:%S")
end

function logger.info(...)
    print(string.format("[%s] snoopy info: ", stamp()), ...)
end

function logger.warn(...)
    warn(string.format("[%s] snoopy warn: ", stamp()), ...)
end

function logger.error(...)
    error(string.format("[%s] snoopy err: %s", stamp(), tostring((...))), 2)
end

return logger
