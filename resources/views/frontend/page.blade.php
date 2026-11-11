@extends('layouts.frontend.app')
@section('content')
    <main class="container px-5 mx-auto">
        <div class="py-10">
            <h1 class="lg:text-3xl text-2xl font-semibold pb-5">{{ $page->sub_title }}</h1>
            <div>
                {!! $page->description !!}
            </div>
        </div>
    </main>
@endsection
