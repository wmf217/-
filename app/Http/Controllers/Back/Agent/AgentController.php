<?php

namespace App\Http\Controllers\Back\Agent;

use App\Nav;
use App\Cinget;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class AgentController extends Controller
{
    public function set() {
        $navs = Nav::with('child')->wherePid(0)->orderBy('order', 'asc')->get();
        $index = "agent";
        $p_index = "agent";
        return view('back.agent.agent.set', compact("index", "p_index", "navs"));
    }
}
