<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', ['as' => 'index', 'uses' => 'Auth\LoginController@index']);

Route::post('/sendcode', ['uses' => 'HomeController@sendcode']);

Route::get('/register', ['as' => 'register', 'uses' => 'Auth\LoginController@register']);

Route::post('/register', ['uses' => 'Auth\LoginController@doRegister']);

Route::get('/login', ['as' => 'login', 'uses' => 'Auth\LoginController@index']);

Route::post('/login', 'Auth\LoginController@login');

Route::get('/logout', 'Auth\LoginController@logout');

Route::any('/account/notify', ['uses' => 'AccountController@notify']); //支付回调

Route::group(['prefix' => 'api', 'middleware' => 'auth'], function () {
    Route::get('/object', ['uses' => 'Back\HomeController@object']); //TODO
});

Route::get('/home', ['as' => 'home', 'uses' => 'HomeController@index'])->middleware('auth');

Route::group(['prefix' => 'home', 'middleware' => 'auth'], function () {
    Route::get('/history-pre', ['uses' => 'HomeController@historyPre']);
    Route::get('/hold-pre', ['uses' => 'HomeController@holdPre']);
});

Route::get('/load', ['as' => 'wait', 'uses' => 'HomeController@load']);

Route::get('/sync', ['as' => 'wait', 'uses' => 'HomeController@sync']);

Route::get('/wait', ['as' => 'wait', 'uses' => 'HomeController@wait']);

Route::get('/sim', ['as' => 'sim', 'uses' => 'Auth\LoginController@sim']);//模拟登陆

//工具
Route::get('/tool/{func}', 'ToolController@index');
//MT4接口
Route::get('/mt4/api/{func}', 'MT4\ApiController@index')->middleware('auth');
//通用
/**
**通用管理start
**/
Route::group(['prefix' => 'common'], function () {
    Route::post('/uploadimg', 'CommonController@uploadImage'); // 通用
});
/**
**佣金管理start
**/
Route::group(['prefix' => 'comm'], function () {
    Route::get('/count', 'CommController@count'); // 通用
});

/**
**账户管理start
**/
Route::group(['prefix' => 'user', 'middleware' => 'auth'], function () {
    Route::get('/info', ['as' => 'user.info', 'uses' => 'UserController@show']);
    Route::post('/info', 'UserController@store');
    Route::get('/phone', ['as' => 'user.phone', 'uses' => 'UserController@phone']);
    Route::get('/email', ['as' => 'user.email', 'uses' => 'UserController@email']);
    Route::get('/password', ['as' => 'user.password', 'uses' => 'UserController@password']);
    Route::get('/heaver', ['as' => 'user.heaver', 'uses' => 'UserController@heaver']);
    Route::get('/report', 'UserController@report');
    Route::get('/bank', 'UserController@bank');
    Route::post('/bank', 'UserController@doBank');
    Route::get('/banks', ['as' => 'user.banks', 'uses' => 'UserController@banks']);
    Route::delete('/banks/{id}', ['uses' => 'UserController@delBank']);
});

/**
**账户管理end
**/

/**
**订单管理start
**/
Route::group(['prefix' => 'order', 'middleware' => 'auth'], function () {
    Route::get('/history/{flag?}', ['as' => 'order.history', 'uses' => 'OrderController@history']);
    Route::get('/hang/{flag?}', ['as' => 'order.hang', 'uses' => 'OrderController@hang']);
    Route::get('/win', ['as' => 'order.win', 'uses' => 'OrderController@win']);
    Route::get('/lose', ['as' => 'order.lose', 'uses' => 'OrderController@lose']);
    Route::get('/hold', ['as' => 'order.hold', 'uses' => 'OrderController@hold']);
    Route::get('/holdhang', ['as' => 'order.holdhang', 'uses' => 'OrderController@holdhang']);
    Route::get('/charge', ['uses' => 'OrderController@charge']);
    Route::get('/api/{column}', ['uses' => 'OrderController@api']);
});
/**
**订单管理end
**/

/**
**出入金管理start
**/
Route::group(['prefix' => 'account', 'middleware' => 'auth'], function () {
    Route::get('/in', ['uses' => 'AccountController@in']);
    Route::post('/in', ['uses' => 'AccountController@pay']);
    Route::get('/list/{type?}/{status?}', ['as' => 'account.out', 'uses' => 'AccountController@inlist']);
    Route::get('/pre/{type?}', ['uses' => 'AccountController@pre']);
    Route::get('/out', ['uses' => 'AccountController@out']);
    Route::post('/out', ['uses' => 'AccountController@doOut']);
    Route::get('/transfer', ['uses' => 'AccountController@transfer']);
    Route::post('/transfer', ['uses' => 'AccountController@doTransfer']);
    Route::get('/translist/{status?}', ['as' => 'account.translist', 'uses' => 'AccountController@translist']);
    Route::get('/api', ['uses' => 'AccountController@api']);
});

/**
**代理专区start
**/

Route::group(['prefix' => 'agent', 'middleware' => 'auth'], function () {
    Route::get('/apply', ['uses' => 'AgentController@apply']);
    Route::post('/apply', ['uses' => 'AgentController@doApply']);
    Route::get('/offline', ['uses' => 'AgentController@offline']);
    Route::get('/offline/async/{uid}', ['uses' => 'AgentController@offlineData']);
    Route::get('/applylist/{status?}', ['as' => 'agent.applylist', 'uses' => 'AgentController@applylist']);
    Route::get('/space', ['uses' => 'AgentController@space']);
    Route::get('/ciontransfer', ['uses' => 'AgentController@ciontransfer']);
    Route::post('/ciontransfer', ['uses' => 'AgentController@doCiontransfer']);
    Route::get('/cionlist/{status?}', ['as' => 'agent.cionlist', 'uses' => 'AgentController@cionlist']);
    Route::get('/cionpre', ['uses' => 'AgentController@cionpre']);
    Route::get('/ciondetail/{status?}', ['uses' => 'AgentController@ciondetail']);
});

Route::get('/back', ['as' => 'back.login','uses' => 'Back\HomeController@login']);

Route::post('/back/login', ['uses' => 'Back\HomeController@doLogin']);

Route::group(['prefix' => 'back', 'middleware' => 'admin'], function () {
        //index
        Route::get('/index', ['as' => 'back.index', 'uses' => 'Back\HomeController@index']);
        //home
        Route::get('/home/{func}', ['uses' => 'Back\HomeController@home']);
        Route::post('/week', ['uses' => 'Back\HomeController@week']);
        //用户业务
        Route::resource('/mix.user', 'Back\User\UserController');
        Route::resource('/mix.simulate', 'Back\User\SimulateController');
        Route::resource('/mix.agent', 'Back\User\AgentController');
        Route::group(['prefix' => 'user'], function () {
            Route::get('/sync', ['uses' => 'Back\User\UserController@sync']);
            Route::get('/reversal/{uid}', ['uses' => 'Back\User\UserController@reversal']);
            Route::get('/pre/{uid}', ['uses' => 'Back\User\UserController@pre']);
            Route::get('/pre-record/{rid}', ['uses' => 'Back\User\UserController@preRecord']);
            Route::get('/pre-agent/{rid}', ['uses' => 'Back\User\UserController@preAgent']);
            Route::get('/pre-cinget/{rid}', ['uses' => 'Back\User\UserController@preCinget']);
            Route::get('/pre-tfrom/{tid}', ['uses' => 'Back\User\UserController@tFrom']);
            Route::get('/pre-tto/{tid}', ['uses' => 'Back\User\UserController@tTo']);
            Route::get('/pre-agentapply/{aid}', ['uses' => 'Back\User\UserController@preAgentApply']);
        });

        Route::group(['prefix' => 'account'], function () {
            Route::get('/pre/{id}', ['uses' => 'Back\Account\AccountController@pre']);
            Route::get('/pre-record/{id}', ['uses' => 'Back\Account\AccountController@preRecord']);
        });

        Route::resource('/mix.in', 'Back\Work\InController');
        Route::resource('/mix.out', 'Back\Work\OutController');
        Route::group(['prefix' => 'out'], function () {
            Route::get('/print-view', ['uses' => 'Back\Work\OutController@printView']);
            Route::get('/print-data', ['uses' => 'Back\Work\OutController@printData']);
            Route::get('/print-excel', ['uses' => 'Back\Work\OutController@printExcel']);
        });
        Route::resource('/mix.tist', 'Back\Work\TistController');
        // 审核业务
        Route::resource('/mix.ucheck', 'Back\Check\UcheckController');
        Route::group(['prefix' => 'ucheck'], function () {
            Route::get('/check/{uid}', ['uses' => 'Back\Check\UcheckController@check']);
            Route::put('/check/{uid}', ['uses' => 'Back\Check\UcheckController@doCheck']);
        });
        Route::resource('/mix.incheck', 'Back\Check\IncheckController');
        Route::group(['prefix' => 'incheck'], function () {
            Route::get('/check/{rid}', ['uses' => 'Back\Check\IncheckController@check']);
            Route::put('/check/{rid}', ['uses' => 'Back\Check\IncheckController@doCheck']);
        });
        Route::resource('/mix.outcheck', 'Back\Check\OutcheckController');
        Route::group(['prefix' => 'outcheck'], function () {
            Route::get('/check/{rid}', ['uses' => 'Back\Check\OutcheckController@check']);
            Route::put('/check/{rid}', ['uses' => 'Back\Check\OutcheckController@doCheck']);
        });
        Route::resource('/mix.tcheck', 'Back\Check\TcheckController');
        Route::group(['prefix' => 'tcheck'], function () {
            Route::get('/check/{tid}', ['uses' => 'Back\Check\TcheckController@check']);
            Route::put('/check/{tid}', ['uses' => 'Back\Check\TcheckController@doCheck']);
        });

        Route::resource('/mix.ccheck', 'Back\Check\CcheckController');
        Route::group(['prefix' => 'ccheck'], function () {
            Route::get('/check/{cid}', ['uses' => 'Back\Check\CcheckController@check']);
            Route::put('/check/{cid}', ['uses' => 'Back\Check\CcheckController@doCheck']);
        });

        Route::resource('/mix.acheck', 'Back\Check\AcheckController');
        Route::group(['prefix' => 'acheck'], function () {
            Route::get('/check/{aid}', ['uses' => 'Back\Check\AcheckController@check']);
            Route::put('/check/{aid}', ['uses' => 'Back\Check\AcheckController@doCheck']);
        });

        Route::resource('/mix.cinget', 'Back\Agent\CingetController');
        Route::group(['prefix' => 'cinget'], function () {
            Route::get('/resource/{cid}', ['uses' => 'Back\Agent\CingetController@resource']);
        });
        Route::resource('/mix.honor', 'Back\Agent\HonorController');
        Route::get('/agent', ['uses' => 'Back\Agent\AgentController@set']); // 特殊

        Route::group(['prefix' => 'reportc'], function () {
            Route::get('/index', ['uses' => 'Back\Report\ReportcController@index']);
        });

        Route::resource('/mix.nav', 'Back\System\NavController');
        Route::resource('/mix.bank', 'Back\System\BankController');
        Route::resource('/mix.setting', 'Back\System\SettingController');
        Route::resource('/mix.group', 'Back\System\GroupController');

});
