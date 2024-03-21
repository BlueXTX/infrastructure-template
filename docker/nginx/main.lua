local opts = {
    ssl_verify = "no",
    redirect_uri = "http://localhost/cb",
    discovery = "http://keycloak:8080/realms/bluextx-app/.well-known/openid-configuration",
    client_id = "openresty",
    client_secret = "9Vm4Ljw5Rqkoz0fawjReJgeMSCk12Tu8"
}

local res, err, _, session = require("resty.openidc").authenticate(opts)
session:close()

if err then
    ngx.log(ngx.ERR, err)
    ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
end

ngx.req.set_header("X-UserId", res.id_token.sub)
