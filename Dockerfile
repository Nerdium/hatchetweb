FROM rust:latest

RUN cargo install --locked trunk
RUN rustup target add wasm32-unknown-unknown

WORKDIR /hatchetweb
COPY . .

# Build the application
RUN trunk build --release

EXPOSE 80
CMD ["trunk", "serve", "--release"]