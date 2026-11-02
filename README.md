# Wiki.js on Orbit

[Wiki.js](https://js.wiki) 2.5 (AGPL-3.0, by requarks), deployed with Orbit. This repository only holds the
Dockerfile: the official image, pinned by digest, run as a non-root user.

## Deploy with Orbit

| Setting | Value |
|---|---|
| Port | `3000` |
| Health path | `/healthz` |
| Size | Large |
| Services next to it | PostgreSQL (and Keycloak, for single sign-on) |

Variables (plain, kept in Git; the password is not one of them):

| Variable | Value |
|---|---|
| `DB_TYPE` | `postgres` |
| `DB_HOST` | `postgres` |
| `DB_PORT` | `5432` |
| `DB_USER` | `app` |
| `DB_NAME` | `app` |
| `DB_PASS` | `$(PGPASSWORD)`: Kubernetes fills it in from the PostgreSQL Secret Orbit gives the application |

## Single sign-on with Keycloak, later

Wiki.js has a Keycloak login built in, set up in its admin page
(**Administration → Authentication → Keycloak**), not in variables. With the
Keycloak service from Orbit's Catalog: host `KEYCLOAK_PUBLIC_URL`, realm and
client made in Keycloak, redirect address shown by Wiki.js.
