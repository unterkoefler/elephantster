module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import IHP.LoginSupport.Middleware
import Web.Controller.Sessions
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.ElephantsterGroups
import Web.Controller.About
import Web.Controller.User

instance FrontController WebApplication where
    controllers =
        [ startPage ElephantsterGroupsAction
        , parseRoute @SessionsController
        , parseRoute @UserController
        -- Generator Marker
        , parseRoute @ElephantsterGroupsController
        , parseRoute @AboutController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
        initAuthentication @User
