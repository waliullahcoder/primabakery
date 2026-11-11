<?php

namespace App;

use App\Models\AdminMenu;
use App\Models\AdminMenuAction;
use App\Models\StaticSiteItem;
use App\Models\Testimonial;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Route;
use Intervention\Image\Facades\Image;
use Spatie\Permission\Models\Permission;
use Yajra\DataTables\Facades\DataTables;

class HelperClass
{
    public static function storeImage($file, $size, $path, $oldImage = NULL)
    {
        $create_path = public_path($path);
        if (!File::isDirectory($create_path)) {
            File::makeDirectory($create_path, 0777, true, true);
        }
        $ext = 'webp';
        $file_name = Carbon::now()->toDateString() . '-' . Str::random(40) . '.' . $ext;
        $path_file_name = $path . $file_name;
        $file = Image::make($file);
        $file->resize($size, null, function ($constraint) {
            $constraint->aspectRatio();
            $constraint->upsize();
        })->stream($ext, 100);
        $file->save($path_file_name);
        if (file_exists($oldImage)) {
            unlink($oldImage);
        }
        return ['status' => 'success', 'path_name' => $path_file_name];
    }

    public static function saveImage($image, $save_path, $old_image = null)
    {
        $path_name = NULL;

        if (isset($image)) {
            $response = HelperClass::storeImage($image, 1920, $save_path, $old_image);
            if ($response['status'] == 'success') {
                $path_name =  $response['path_name'];
            } else {
                $path_name = NULL;
            }
        } else {
            $path_name = NULL;
        }

        return $path_name;
    }

    public static function convertNumber($num)
    {
        $ones = [
            0 => '',
            1 => 'one',
            2 => 'two',
            3 => 'three',
            4 => 'four',
            5 => 'five',
            6 => 'six',
            7 => 'seven',
            8 => 'eight',
            9 => 'nine',
            10 => 'ten',
            11 => 'eleven',
            12 => 'twelve',
            13 => 'thirteen',
            14 => 'fourteen',
            15 => 'fifteen',
            16 => 'sixteen',
            17 => 'seventeen',
            18 => 'eighteen',
            19 => 'nineteen'
        ];

        $tens = [
            0 => '',
            2 => 'twenty',
            3 => 'thirty',
            4 => 'forty',
            5 => 'fifty',
            6 => 'sixty',
            7 => 'seventy',
            8 => 'eighty',
            9 => 'ninety'
        ];

        $higherUnits = [
            1 => 'thousand',
            2 => 'lakh',
            3 => 'crore'
        ];

        if ($num == 0) {
            return 'zero';
        }

        // Split number into groups of 2 or 3 digits for Indian system (lakhs, crores)
        $groups = [];
        while ($num > 0) {
            if (count($groups) == 1) {
                $groups[] = $num % 100; // Group of two digits for thousands
                $num = (int)($num / 100);
            } else {
                $groups[] = $num % 1000; // Groups of three digits for hundreds, lakhs, crores
                $num = (int)($num / 1000);
            }
        }

        // Convert each group into words
        $words = [];
        foreach ($groups as $index => $group) {
            if ($group == 0) {
                continue;
            }

            $groupWords = '';

            // Handle hundreds place
            if ($group >= 100) {
                $groupWords .= $ones[(int)($group / 100)] . ' hundred ';
                $group %= 100;
            }

            // Handle tens and ones
            if ($group >= 20) {
                $groupWords .= $tens[(int)($group / 10)] . ' ' . $ones[$group % 10];
            } else {
                $groupWords .= $ones[$group];
            }

            // Add the scale (thousand, lakh, crore)
            if ($index > 0) {
                $groupWords .= ' ' . $higherUnits[$index] . ' ';
            }

            $words[] = $groupWords;
        }

        return implode(' ', array_reverse($words));
    }

    public static function resourceDataView($model, array $data_column, NULL|array $image_column, string $route_path)
    {
        if (request()->ajax()) {

            // make a eloquent od Yajra Fcade Datatables class's
            $datatables_eloquent = DataTables::eloquent($model);
            $datatables_eloquent->addIndexColumn();
            // checkbox column
            $datatables_eloquent->addColumn('checkbox', function ($row) {
                $checkbox =
                    '<div class="custom-control custom-checkbox"><input type="checkbox" class="custom-control-input multi_checkbox" id="' . $row->id . '" name="multi_checkbox[]" value="' . $row->id . '"><label for="' . $row->id . '" class="custom-control-label"></label></div>';
                return $checkbox;
            });

            // push status column into the instance of data table eloquent
            $datatables_eloquent->addColumn('status', function ($row) use ($route_path) {
                if (Route::has("admin.{$route_path}.edit")) {
                    return '<div class="form-check form-switch"><input class="form-check-input change-status c-pointer" data-url="' . Route("admin.{$route_path}.edit", $row->id) . '" type="checkbox" name="status"' . ($row->status == 1 ? 'checked' : '') . '></div>';
                }
            });

            // initiate an instance of available images file's
            $images_column = [];

            // if images data is available on our database model's then push it on our data table eloquent
            if (is_array($image_column)) {
                $images_column = $image_column;
                foreach ($images_column as $data) {
                    $datatables_eloquent->addColumn($data, function ($row) use ($data) {
                        return '<img src="' . asset($row[$data]) . '" height="50" alt=""/>';
                    });
                }
            }

            // if any type of data columns are available in our db model then push it data table eloquent
            foreach ($data_column as $data) {
                $datatables_eloquent->addColumn($data, function ($row) use ($data) {
                    return $row[$data];
                });
            }

            // at last create an action columns `edit` & `delete` and push in our data table eloquent
            $datatables_eloquent->addColumn('actions', function ($row) use ($route_path) {
                $currentRouteName = \Request::route()->getName();
                $menu = AdminMenu::where('route', $currentRouteName)->first();
                $actionBtn = '<div class="btn-group">';
                if (!is_null($menu)) {
                    $edit = str_replace('index', 'edit', $menu->route);
                    $delete = str_replace('index', 'destroy', $menu->route);
                    if (Route::has("admin.{$route_path}.edit")) {
                        $menuAction = AdminMenuAction::where('route', $edit)->first();
                        if ($menuAction) {
                            $currentRoutePermission = Permission::findById($menuAction->permission_id);
                            if (!is_null($currentRoutePermission)) {
                                if (auth()->user()->can($currentRoutePermission->name)) {
                                    $actionBtn .= '<a href="' . Route("admin.{$route_path}.edit", $row->id) . '" class="btn btn-sm btn-warning border-0 px-10px fs-15 tt link-edit" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit"><i class="far fa-pencil-alt"></i></a>';
                                }
                            }
                        }
                    }
                    if (Route::has("admin.{$route_path}.destroy")) {
                        $menuAction = AdminMenuAction::where('route', $delete)->first();
                        if ($menuAction) {
                            $currentRoutePermission = Permission::findById($menuAction->permission_id);
                            if (!is_null($currentRoutePermission)) {
                                if (auth()->user()->can($currentRoutePermission->name)) {
                                    $actionBtn .= '<button type="button" class="btn btn-sm btn-danger border-0 px-10px fs-15 tt link-delete" data-url="' . Route("admin.{$route_path}.destroy", $row->id) . '" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete"><i class="far fa-trash-alt"></i></button>';
                                }
                            }
                        }
                    }
                }
                $actionBtn .= '</div>';
                return $actionBtn;
            });

            // serialize our and push all db model's columns which we're showing in our front-end in data table eloquent
            $row_columns = [
                'checkbox',
                ...$images_column,
                ...$data_column,
                'status',
                'actions',
            ];

            // At last return our data table's eloquent!
            return $datatables_eloquent->rawColumns($row_columns)->make(true);
        }

        return view("admin.{$route_path}.index");
    }

    public static function testimonial()
    {
        $site_items = StaticSiteItem::select('testimonial_title', 'testimonial_image')->first();
        $testimonials = Testimonial::latest('serial')->get();
        return [
            'testimonials' => $testimonials,
            'testimonial_title' => $site_items['testimonial_title'],
            'testimonial_image' => asset($site_items['testimonial_image']),
        ];
    }


    /**
     * @uses - use it a resources controller's store function for store a table's in a database's table.
     * @param string $table receive a database table's name.
     * @param mixed $request receive a array of requested data which data's input fields `name` and database table's columns names will must be same as.
     * @param array $request_data receive a array of database table's columns name which requested data's input fields `name` and database table's columns names will must be same as.
     * @param array|null $files receive a array of requested files which data's input fields `name` and database table's columns names will must be same as, if user input's a files is required then the set the input's name field values otherwise it would be always null.
     * @param string|null $file_path if user input a file is required then give file path to store this file.
     * @param string $route receive a route's name of the resources controller's route path name.
     * @param array|null $multiple_file receive a array of requested files {from multiple file selected input's field} which data's input fields `name` and database table's columns names will must be same as, if user input's a files is required then the set the input's name field values otherwise it would be always null.
     */
    public static function resourceDataStore(
        string $table,
        $request,
        array $request_data,
        array|NULL $files,
        string|NULL $file_path,
        string $route,
        array|NULL $multiple_file = null
    ) {
        $creation_data = [];

        // push all requested post data into creation data table
        foreach ($request_data as $data) {
            $creation_data[$data] = $request[$data];
        }

        // create a slug is need a slug
        if (in_array("slug", $request_data)) {
            $creation_data["slug"] = Str::slug($request->title, "-");
        }

        if ($multiple_file && is_array($multiple_file) && $file_path) {
            foreach ($multiple_file as $file) {
                $all_file = [];

                foreach ($request->file($file) as $single_file) {
                    $all_file[] = HelperClass::saveImage($single_file, $file_path);
                }

                $creation_data[$file] = json_encode($all_file);
            }
        }


        if (is_array($files) && $file_path) {
            foreach ($files as $file) {
                $file_path = HelperClass::saveImage($request->file($file), $file_path);
                $creation_data[$file] = $file_path;
            }
        }

        $creation_data['created_at'] = Carbon::now();
        $creation_data['updated_at'] = Carbon::now();

        DB::table($table)->insert($creation_data);

        return redirect()->route("admin.{$route}.index")->withSuccessMessage('Created Successfully!');
    }

    /**
     * @uses - use it a resources controller's edit function return to view a edit form page.
     * @param string $table receive a database table's name.
     * @param string $id receive a unique id of editing data.
     * @param string $route receive a route's name of the resources controller's route path name.
     */
    public static function resourceDataEdit(string $table_name, string $id, string $route)
    {
        if (request()->ajax() && request('status') == 'true') {
            $data = DB::table($table_name)->where('id', $id)->first();

            DB::table($table_name)->where('id', $id)->update(['status' => !$data->status]);

            return response()->json(['status' => 'success']);
        }

        $data = DB::table($table_name)->where('id', $id)->first();

        return view("admin.{$route}.edit", compact('data'));
    }

    /**
     * @uses - use it a resources controller's index function for update a data from a database's table.
     * @param string $table receive a database table's name.
     * @param string $id receive a unique id of updating data.
     * @param mixed $request receive a array of requested data which data's input fields `name` and database table's columns names will must be same as.
     * @param array $request_data receive a array of database table's columns name which requested data's input fields `name` and database table's columns names will must be same as.
     * @param array|null $files receive a array of requested files which data's input fields `name` and database table's columns names will must be same as, if user input's a files is required then the set the input's name field values otherwise it would be always null.
     * @param string|null $file_path if user input a file is required then give file path to store this file.
     * @param string $route receive a route's name of the resources controller's route path name.
     * @param array|null $multiple_file receive a array of requested files {from multiple file selected input's field} which data's input fields `name` and database table's columns names will must be same as, if user input's a files is required then the set the input's name field values otherwise it would be always null.
     */
    public static function resourceDataUpdate(string $table_name, string $id, $request, array $request_data, array|NULL $files, string|NULL $file_path, string $route, array|NULL $multiple_file = null)
    {
        $data = DB::table($table_name)->where('id', $id)->first();

        $get_single_data = function ($key) use ($data) {
            return $data->$key;
        };

        // if multiple file insertion requirement is available here then looping to insert.
        if (is_array($multiple_file) && $file_path) {
            foreach ($multiple_file as $file) {

                if ($request->file($file)) {
                    $get_files = json_decode($data->$file, true);

                    // Delete the previous files using previous image's file path
                    if (is_array($get_files)) {
                        foreach ($get_files as $single_file) {
                            if (file_exists($single_file)) {
                                unlink($single_file);
                            }
                        }
                    }
                }
            }
        }

        $creation_data = [];

        // push all requested post data into creation data table
        foreach ($request_data as $data) {
            $creation_data[$data] = $request[$data];
        }

        // create a slug is need a slug
        if (in_array("slug", $request_data)) {
            $creation_data["slug"] = Str::slug($request->title, "-");
        }

        // if any multiple file upload or update system is available here!
        if (is_array($multiple_file) && $file_path) {
            foreach ($multiple_file as $file) {

                // initiate a empty array to store multiple image path
                $all_file = [];

                if ($request->file($file)) {
                    foreach ($request->file($file) as $single_file) {
                        $all_file[] = HelperClass::saveImage($single_file, $file_path);
                    }

                    // encode to covert a string from an array fo inserting multiple images path
                    $creation_data[$file] = json_encode($all_file);
                }
            }
        }

        // for single file upload or update here!
        if ($files && is_array($files) && $file_path) {
            foreach ($files as $file) {
                $get_file = $get_single_data($file);

                $image = $request->file($file);
                if ($image) {
                    $file_path = HelperClass::saveImage($image, $file_path);
                    $creation_data[$file] = $file_path;

                    if (file_exists($get_file)) {
                        unlink($get_file);
                    }
                }
            }
        }

        // initiate lates updated date into our table row's
        $creation_data['updated_at'] = Carbon::now();

        // insert data into this table
        DB::table($table_name)->where('id', $id)->update($creation_data);

        // after successful that operation then redirect and send a success message!
        return redirect()->route("admin.{$route}.index")->withSuccessMessage('Updated Successfully!');
    }

    /**
     * @uses - use it a resources controller's delete function for delete a data from database's table.
     * @param string $table receive a database table's name.
     * @param mixed $request receive a array of requested data's id if selected multiple data to delete from database's table.
     * @param string $id receive a unique id of deleting data.
     * @param array|null $files receive a array of files columns name's for deleting file from our database table's and storage if it exists, otherwise it would be always null.
     * @param array|null $multiple_file receive a array of files columns name's of multiple file's column's for deleting multiple file from our database table's and storage if it exists, otherwise it would be always null.
     */
    public static function resourceDataDelete(string $table_name, $request, string $id, array|NULL $files, array|NULL $multiple_file = null)
    {

        // multiple id selection for deleting data are available then looping!
        // get multiple data's id from `request->id`
        if ($request->id) {
            $delete_ids = $request->id;

            $delete_all_data = DB::table($table_name)->whereIn('id', $delete_ids)->get();

            // Initialize an array of file's path for deleting files
            $deleting_files = [];

            foreach ($delete_all_data as $all_data) {
                if (is_array($multiple_file)) {
                    foreach ($multiple_file as $files) {
                        $files_path = json_decode($all_data->$files, true);

                        if (is_array($files_path)) {
                            $deleting_files = array_merge($deleting_files, $files_path);
                        }
                    }
                }

                if (is_array($files)) {
                    foreach ($files as $file) {
                        $deleting_files[] = $all_data->$file;
                    }
                }
            }

            foreach ($deleting_files as $single_file) {
                if (file_exists($single_file)) {
                    unlink($single_file);
                }
            }

            DB::table($table_name)->whereIn('id', $delete_ids)->delete();

            return response()->json(['status' => 'success']);
        }

        // delete single items
        $data = DB::table($table_name)->where('id', $id)->first();

        if ($files) {
            foreach ($files as $file) {
                $file_path = $data->$file;
                if (file_exists($file_path)) {
                    unlink($file_path);
                }
            }
        }

        // when multiple file path are available for deleting!
        if (is_array($multiple_file)) {
            foreach ($multiple_file as $file) {
                // $file_path = $data->$file;

                $files_path = json_decode($data->$file, true);
                if (is_array($files_path)) {
                    foreach ($files_path as $single_file_path) {
                        if (file_exists($single_file_path)) {
                            unlink($single_file_path);
                        }
                    }
                }
            }
        }

        DB::table($table_name)->where('id', $id)->delete();

        return response()->json(['status' => 'success']);
    }

    /**
     * @uses - use it a resources controller's edit function for save data in a database's table.
     * @param string $table receive a database table's name.
     * @param mixed $request receive a array of requested data which data's input fields `name` and database table's columns names will must be same as.
     * @param array $request_data receive a array of database table's columns name which requested data's input fields `name` and database table's columns names will must be same as.
     * @param array|null $files receive a array of requested files which data's input fields `name` and database table's columns names will must be same as, if user input's a files is required then the set the input's name field values otherwise it would be always null.
     * @param string|null $file_path if user input a file is required then give file path to store this file.
     * @param string $route receive a route's name of the resources controller's route path name.
     * @param array|null $multiple_file receive a array of requested files {from multiple file selected input's field} which data's input fields `name` and database table's columns names will must be same as, if user input's a files is required then the set the input's name field values otherwise it would be always null.
     */
    public static function resourceDataSave($data, $request, array $requests_data, array|NULL $files, string|NULL $file_path)
    {

        foreach ($requests_data as $request_data) {
            $data[$request_data] = $request[$request_data];
        }

        if ($files && $file_path) {
            foreach ($files as $file) {
                $get_file = $request->file($file);
                $old_file = $data->$file;

                if ($get_file) {
                    $image_path = HelperClass::saveImage($get_file, $file_path, $old_file);
                    $data[$file] = $image_path;
                }
            }
        }

        $data->save();


        return redirect()->back()->withSuccessMessage('Updated Successfully!');
    }

    /**
     * @uses - is this an alternative of HelperClass::resourceDataSave function's.
     */
    public static function resourceSaveData(string $table_name, $request, array $requests_data, array|NULL $files, string|NULL $file_path)
    {
        $data  = DB::table($table_name)->latest('updated_at')->first();

        if (is_null($data)) {
            $instance_data = [];

            foreach ([...$requests_data, ...$files] as $single_data) {
                $instance_data[$single_data] = 1;
            }

            $data = DB::table($table_name)->insert($instance_data);
        }

        $updated_data = [];

        foreach ($requests_data as $request_data) {
            $updated_data[$request_data] = $request[$request_data];
        }

        if ($files && $file_path) {
            foreach ($files as $file) {
                $get_file = $request->file($file);

                if ($get_file) {
                    $image_path = HelperClass::saveImage($get_file, 'media/skill_information');
                    $updated_data[$file] = $image_path;
                }
            }
        }

        DB::table($table_name)->where('id', $data->id)->update($updated_data);

        return redirect()->back()->withSuccessMessage('Updated Successfully!');
    }

    /**
     * @uses - to check a it's parameter as a string would be a youtube embed video's url or not.
     * @param string $url receive youtube embed video url.
     */
    public static function validateYoutubeVideoURL(string|NULL $url)
    {
        if (is_null($url)) return false;

        $permission = intval(env('YOUTUBE_VIDEO_VALIDATION'));
        $split_url = explode('/', $url);

        if ($permission) {
            if (in_array('www.youtube.com', $split_url) && in_array('embed', $split_url)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public static function siteItems(string $selector)
    {
        return StaticSiteItem::select($selector)->first()->$selector;
    }
}
