<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class OutShipped extends Mailable
{
    use Queueable, SerializesModels;

    public $code;
    public $status;
    public $note;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($code, $status, $note='')
    {
        $this->code = $code;
        $this->status = $status;
        $this->note = $note;
        $this->subject = 'BCS出金审核通知';
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('email.outcheck')->with([
                        'code' => $this->code,
                        'status' => $this->status,
                        'note' => $this->note,
               ]);
    }
}
