# deal.II docker toolchain

Provides a dockerized toolchain for deal.II.

## 1. build docker image

```
	docker build -t juliandoerner/dealii_toolchain:0.1 -f Dockerfile .
```

## 2. start docker image
```
	./run_script.sh
```

## 3. connect with ssh
```
	ssh -p 2222 dealii@localhost
```
with password dealii.


