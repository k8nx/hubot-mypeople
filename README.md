# MyPeople Hubot Adapter

## Usage

알림 콜백 주소는 여러분이 쓰시는 서버 HTTP 주소 + /mypeople/callback 를 적어주시면 됩니다.

ex) http://xxx.geekple.com/mypeople/callback

하루 2000건 제한은 좀 적은 것 같다. 늘려주삼....

```shell
export HUBOT_MYPEOPLE_KEY='API KEY'
vi package.json
...
  "dependencies": {
    "hubot":         ">= 2.5.1",
    "hubot-scripts": ">= 2.4.2",
    "hubot-mypeople": "0.0.2",
    "express": ">=3.0.0"
  },
...

bin/hubot -a mypeople
```

[MyPeople API](https://github.com/dgkim84/node-mypeople)
