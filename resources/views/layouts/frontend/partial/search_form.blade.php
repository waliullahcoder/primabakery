<div id="search-form"
    class="hidden fixed top-0 left-0 w-full min-h-screen items-center justify-center bg-[#000000ad] z-[9999]">
    <div class="absolute top-0 right-0 z-20">
        <i id="close-search"
            class="fa-solid fa-xmark text-2xl font-medium m-5 px-3 py-2 bg-red-400 text-slate-100 rounded-md cursor-pointer hover:bg-red-600 duration-300"></i>
    </div>
    <form action="{{ Route('frontend.search') }}" method="GET" class="container mx-auto px-4">
        <input type="search"
            class="outline-none focus:outline-none px-8 py-5 text-2xl font-medium placeholder:font-normal bg-transparent border-b-4 border-l-0 border-r-0 border-slate-300 border-t-4 text-slate-300 font-mono placeholder:font-sans w-full" name="search"
            placeholder="Search here...">
    </form>
</div>
