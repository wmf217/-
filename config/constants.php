<?php

return [
    'VERSION' => 'v1.0.0',
    'STATUS' => [
        '0' => '等待处理',
        '1' => '成功',
        '2' => '失败'
    ],
    'STATUSID' => [
        'WAIT' => '0',
        'SUCCESS' => '1',
        'FAIL' => '2'
    ],
	'ORDERFLAG' => [
		'0' => '买入',
        '1' => '卖出'
	],
    'ORDERFLAGID' => [
		'BUY' => '0',
        'SELL' => '1'
	],
    'HANGFLAG' => [
		'2' => '买入限价',
        '3' => '卖出限价',
        '4' => '买入止损',
        '5' => '卖出止损',
	],
    'RECORDSTATUS' => [
        '2' => '入金失败',
        '1' => '入金成功',
        '0' => '等待处理'
    ],
    'RECORDSTATUSID' => [
        'FAIL' => '2',
        'SUCCESS' => '1',
        'WAIT' => '0'
    ],
    'RECORDWAY' => [
        '0' => '充值提款',
        '1' => '佣金转账',
        '2' => '账户转账'
    ],
    'RECORDWAYID' => [
        'CHARGE' => '0',
        'COMMISSION' => '1',
        'TRANSFER' => '2'
    ],
    'AGENTAPPLYSTATUS' => [
        '0' => '等待处理',
        '1' => '成功',
        '2' => '失败'
    ],
];
