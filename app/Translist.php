<?php

namespace App;
use Illuminate\Database\Eloquent\Model as BaseModel;
use Illuminate\Database\Eloquent\SoftDeletes;
class Translist extends BaseModel
{
      use SoftDeletes;
      protected $fillable = [
          'amount', 'from','to','reason'
      ];

      public function fromUser() {
          return $this->belongsTo('App\User', 'from');
      }

      public function toUser() {
          return $this->belongsTo('App\User', 'to');
      }

      public function getfromUsernameAttribute () {
          return $this->fromUser->name;
      }

      public function gettoUsernameAttribute () {
          return $this->toUser->name;
      }
}
