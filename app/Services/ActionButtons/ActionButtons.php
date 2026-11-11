<?php

namespace App\Services\ActionButtons;

use App\Models\AdminMenu;
use App\Models\AdminMenuAction;
use Spatie\Permission\Models\Permission;

class ActionButtons
{
    public static function actions($data, $addiotional_buttons = null)
    {
        $actions = "<div class='btn-group'>";
        $currentRouteName = \Request::route()->getName();
        $menu = AdminMenu::where('route', $currentRouteName)->first();
        $edit = str_replace('index', 'edit', $menu->route);
        $delete = str_replace('index', 'destroy', $menu->route);

        $menuAction = AdminMenuAction::where('route', $edit)->first();
        if ($menuAction) {
            $currentRoutePermission = Permission::findById($menuAction->permission_id);
            if (!is_null($currentRoutePermission)) {
                if (auth()->user()->can($currentRoutePermission->name) && $data['edit'] == true) {
                    $actions .= '<a href="' . Route($edit, $data['id']) . '" class="btn btn-sm btn-warning border-0 px-10px fs-15 tt link-edit" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit"><i class="far fa-pencil-alt"></i></a>';
                } elseif (auth()->user()->can($currentRoutePermission->name) && $data['edit'] == false) {
                    $actions .= '<button type="button" class="btn btn-sm border-0 px-10px fs-15 btn-success tt link-recovery" data-url="' . Route($delete, $data['id']) . '" data-bs-toggle="tooltip" data-bs-placement="top" title="Recover"><i class="fad fa-recycle"></i></button>';
                }
            }
        }
        if (!is_null($addiotional_buttons)) {
            $actions .= $addiotional_buttons;
        }
        $menuAction = AdminMenuAction::where('route', $delete)->first();
        if ($menuAction) {
            $currentRoutePermission = Permission::findById($menuAction->permission_id);
            if (!is_null($currentRoutePermission)) {
                if (auth()->user()->can($currentRoutePermission->name) && $data['edit'] == true) {
                    $actions .= '<button type="button" class="btn btn-sm border-0 px-10px fs-15 btn-danger tt link-delete" data-url="' . Route($delete, $data['id']) . '" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete"><i class="far fa-trash-alt"></i></button>';
                } elseif (auth()->user()->can($currentRoutePermission->name) && $data['edit'] == false) {
                    $actions .= '<button type="button" class="btn btn-sm border-0 px-10px fs-15 btn-danger tt trash_delete" data-url="' . Route($delete, $data['id']) . '" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete Permanently"><i class="far fa-trash-alt"></i></button>';
                }
            }
        }
        return $actions .= "</div>";
    }
}
