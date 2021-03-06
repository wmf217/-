<?php

namespace App\Http\Middleware;

use Closure;

class Admin
{

    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure                 $next
     * @param string|null              $guard
     *
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(!\Auth::check()||\Auth::user()->role != 0){
            return redirect('/back');
        }
        return $next($request);
    }
}
