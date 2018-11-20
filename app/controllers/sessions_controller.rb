class SessionsController < ApplicationController
    def create
        render jason: {session:"created"}
    end
end
