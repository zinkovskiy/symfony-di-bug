To reproduce the issue please build docker container and run

```shell
composer install
```

```shell 
/var/www/bin/console app:test
```

Exception will be thrown:
```
No transport supports the given Messenger DSN. Run "composer require symfony/amqp-messenger" to install AMQP transport. 
```

But it should not, because environment is dev, composer require-dev section contains
`symfony/amqp-messenger` dependency

In my opinion exception is occurred because AmqpTransportFactory is not registered by framework-bundle.

Unfortunately I don't have strong symfony knowledge to make fix by myself