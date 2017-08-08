<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class LoginShipped extends Mailable
{
    use Queueable, SerializesModels;

    public $code;
    public $password;
    public $read;
    public $fullname;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($code, $password, $read, $fullname)
    {
        $this->code = $code;
        $this->password = $password;
        $this->read = $read;
        $this->fullname = $fullname;
        $this->subject = 'BCS审核通知';
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('email.sendlogin')->with([
                        'code' => $this->code,
                        'password' => $this->password,
                        'read' => $this->read,
                        'fullname' => $this->fullname,
               ]);
    }
}
