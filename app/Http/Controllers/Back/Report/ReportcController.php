<?php

namespace App\Http\Controllers\Back\Report;
use App\Nav;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class ReportcController extends Controller // 图表
{
    public function index (Request $request) {
        $navs = Nav::with('child')->wherePid(0)->orderBy('order', 'asc')->get();
        $index = 'report_all';
        $p_index = 'report';
        return view('back.report.reportc.index', compact('index', 'p_index', 'navs'));
    }
}
