FROM rust:1.67.0-slim-buster

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y libpq-dev

ENV RUST_BACKTRACE=1

WORKDIR /app
COPY . .

RUN rustup default nightly
RUN cargo build --release

RUN cargo install diesel_cli --no-default-features --features postgres

EXPOSE 8080
CMD ["cargo", "run", "--release"]
