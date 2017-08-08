<?php

namespace App;
use Illuminate\Database\Eloquent\Model as BaseModel;

class Setting extends BaseModel
{
    protected $fillable = [
        'name', 'logo', 'tel', 'email', 'url', 'qq', 'fax' ,'address', 'email_smtp', 'email_port', 'email_login'
        , 'email_password', 'QRCode', 'Copyright', 'userBanks','volume'
    ];
}
