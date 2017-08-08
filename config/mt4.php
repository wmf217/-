<?php
return [
    'userinfo' => ['item' => 'GetUser', 'url' => '/User/GetUser'],//获取用户
    'online' => ['item' => 'GetOnlineTrader', 'url' => '/Trader/GetOnlineTrader'],//在线订单
    'deposit' => ['item' => 'Deposit', 'url' => '/User/Deposit'],//出入金
    'history' => ['item' => 'GetHistoryTrader', 'url' => '/Trader/GetHistroyTrader'],//历史订单
    'signin' => ['item' => 'NewUser', 'url' => '/User/NewUser'],//新用户
    'password' => ['item' => 'ChangePwd', 'url' => '/User/ChangePwd'],//修改密码
];
?>
