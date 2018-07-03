--------------------------------------------------------------------------------
CREATE TYPE ABILITY AS ENUM
(
);
--------------------------------------------------------------------------------
CREATE TABLE jail_templates
(  id         BIGSERIAL NOT NULL PRIMARY KEY
,  timestamp  TIMESTAMP NOT NULL DEFAULT now()
,  name       TEXT      NOT NULL UNIQUE
,  script     TEXT      NOT NULL
);
--------------------------------------------------------------------------------
CREATE TABLE webhooks
(  id         BIGSERIAL NOT NULL PRIMARY KEY
,  timestamp  TIMESTAMP NOT NULL DEFAULT now()
,  request    JSONB     NOT NULL
);
--------------------------------------------------------------------------------
CREATE TABLE repos
(  id         BIGSERIAL NOT NULL PRIMARY KEY
,  timestamp  TIMESTAMP NOT NULL DEFAULT now()
,  url        TEXT      NOT NULL UNIQUE
);
--------------------------------------------------------------------------------
CREATE TABLE branches
(  id         BIGSERIAL NOT NULL PRIMARY KEY
,  repo_id    BIGINT    NOT NULL REFERENCES repos (id)
,  timestamp  TIMESTAMP NOT NULL DEFAULT now()
,  name       TEXT      NOT NULL UNIQUE
);
--------------------------------------------------------------------------------
CREATE TABLE commits
(  id         BIGSERIAL NOT NULL PRIMARY KEY
,  branch_id  BIGINT    NOT NULL REFERENCES branches (id)
,  timestamp  TIMESTAMP NOT NULL DEFAULT now()
,  hash       TEXT      NOT NULL UNIQUE
);
--------------------------------------------------------------------------------
CREATE TABLE builds
(  id               BIGSERIAL NOT NULL PRIMARY KEY
,  jail_template_id BIGINT    NOT NULL DEFAULT 1 REFERENCES jail_templates (id)
,  repo_id          BIGINT    NOT NULL REFERENCES repos (id)
,  branch_id        BIGINT    NOT NULL REFERENCES branches (id)
,  commit_id        BIGINT    NOT NULL REFERENCES commits (id)
,  timestamp        TIMESTAMP NOT NULL DEFAULT now()
,  status           TEXT      NOT NULL
);
--------------------------------------------------------------------------------
CREATE TABLE build_logs
(  id         BIGSERIAL NOT NULL PRIMARY KEY
,  build_id   BIGINT    NOT NULL REFERENCES builds (id)
,  timestamp  TIMESTAMP NOT NULL DEFAULT now()
,  message    JSONB     NOT NULL
);
--------------------------------------------------------------------------------
CREATE TABLE artifacts
(  id         BIGSERIAL NOT NULL PRIMARY KEY
,  build_id   BIGINT    NOT NULL REFERENCES builds (id)
,  timestamp  TIMESTAMP NOT NULL DEFAULT now()
,  path       TEXT      NOT NULL UNIQUE
);
--------------------------------------------------------------------------------
CREATE TABLE users
(  id         BIGSERIAL NOT NULL PRIMARY KEY
,  timestamp  TIMESTAMP NOT NULL DEFAULT now()
,  name       TEXT      NOT NULL UNIQUE
,  credential TEXT      NOT NULL
,  abilities  ABILITY[] NOT NULL
);
--------------------------------------------------------------------------------
CREATE TABLE keys
(  id         BIGSERIAL NOT NULL PRIMARY KEY
,  user_id    BIGINT    NOT NULL REFERENCES users (id)
,  timestamp  TIMESTAMP NOT NULL DEFAULT now()
,  value      JSONB     NOT NULL
);
--------------------------------------------------------------------------------
CREATE TABLE api_logs
(  id         BIGSERIAL NOT NULL PRIMARY KEY
,  user_id    BIGINT    NOT NULL REFERENCES users (id)
,  timestamp  TIMESTAMP NOT NULL DEFAULT now()
,  request    JSONB     NOT NULL
,  response   JSONB     NOT NULL
);
--------------------------------------------------------------------------------
CREATE TABLE hosts
(  id         BIGSERIAL NOT NULL PRIMARY KEY
,  timestamp  TIMESTAMP NOT NULL DEFAULT now()
,  name       TEXT      NOT NULL UNIQUE
,  config     JSONB     NOT NULL
,  status     TEXT      NOT NULL
);
--------------------------------------------------------------------------------
CREATE TABLE deploys
(  id          BIGSERIAL NOT NULL PRIMARY KEY
,  artifact_id BIGINT    NOT NULL REFERENCES artifacts (id)
,  host_id     BIGINT    NOT NULL REFERENCES hosts (id)
,  timestamp   TIMESTAMP NOT NULL DEFAULT now()
,  status      TEXT      NOT NULL
);
--------------------------------------------------------------------------------
CREATE TABLE deploy_logs
(  id         BIGSERIAL NOT NULL PRIMARY KEY
,  deploy_id  BIGINT    NOT NULL REFERENCES deploys (id)
,  timestamp  TIMESTAMP NOT NULL DEFAULT now()
,  message    JSONB     NOT NULL
);
--------------------------------------------------------------------------------
