json.bug do
  json.application_token @bug.application_token
  json.number @bug.number
  json.status @bug.status
  json.priority @bug.priority

  json.state do
    json.device  @bug.state.device
    json.os      @bug.state.os
    json.memory  @bug.state.memory
    json.storage @bug.state.storage
  end
end
