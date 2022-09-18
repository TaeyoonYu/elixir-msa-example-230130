# Elixir MSA Example

## Environments

- erlang `25.0.4`
- elixir `1.14.0-otp-25`
  - phoenix `1.6.12`

## Setup

```shell
$ mix setup
$ mix compile
```

## Run

```shell
$ cd apps/my
$ iex --sname my1 -S mix
$ iex --sname my2 -S mix
$ iex --sname my3 -S mix
```

```shell
$ cd apps/my_web
$ iex --sname my_web -S mix phx.server
```
