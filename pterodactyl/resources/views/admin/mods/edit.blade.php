@extends('layouts.admin')

@section('title')
    Edit Mod
@endsection

@section('content-header')
    <h1>Edit Mod
        <small>You can create mod.</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="{{ route('admin.index') }}">Admin</a></li>
        <li><a href="{{ route('admin.mods') }}">Mod Manager</a></li>
        <li class="active">Edit Mod</li>
    </ol>
@endsection

@section('content')
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Edit Mod</h3>
                    <div class="box-tools">
                        <a href="{{ route('admin.mods') }}">
                            <button type="button" class="btn btn-sm btn-primary"
                                    style="border-radius: 0 3px 3px 0;margin-left:-1px;">Go Back
                            </button>
                        </a>
                    </div>
                </div>
                <form method="post" action="{{ route('admin.mods.update', $mod->id)  }}">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-8 col-xs-12">
                                <div class="form-group">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" name="name" id="name" class="form-control"
                                           placeholder="For example: Health System" value="{{$mod->name}}" />
                                </div>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <div class="form-group">
                                    <label for="version" class="form-label">Version</label>
                                    <input type="text" name="version" id="version" class="form-control"
                                           placeholder="For example: 1.0" value="{{$mod->version}}" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="category" class="form-label">Category</label>
                            <input type="text" name="category" id="category" class="form-control"
                                   placeholder="For example: Tools" value="{{$mod->category_name}}" />
                        </div>
                        <div class="form-group">
                            <label for="description" class="form-label">Description</label>
                            <input type="text" name="description" id="description" class="form-control"
                                   placeholder="Short Description" value="{{$mod->description}}" />
                        </div>
                        <hr>
                        <div class="form-group">
                            <label for="egg_ids" class="form-label">Servers (when it's available)</label>
                            <select class="form-control" id="egg_ids" name="egg_ids[]" multiple>
                                @foreach($eggs as $egg)
                                    @if (in_array($egg->id, explode(',', $mod->egg_id)))
                                        <option value="{{ $egg->id }}" selected>{{ $egg->name }}</option>
                                    @else
                                        <option value="{{ $egg->id }}">{{ $egg->name }}</option>
                                    @endif
                                @endforeach
                            </select>
                        </div>
                        <div class="row">
                            <div class="form-group col-12 col-md-8">
                                <label for="download" class="form-label">Download URL</label>
                                <input type="text" name="download" id="download" class="form-control"
                                       placeholder="For example: https://mydomain.tld/mod.zip"
                                       value="{{$mod->download_url_zip}}" />
                                <p class="small text-muted no-margin">This file will be download when users install this
                                    mod.</p>
                            </div>
                            <div class="form-group col-12 col-md-4">
                                <label for="decompress_type" class="form-label">Decompress Type</label>
                                <select id="decompress_type" name="decompress_type" class="form-control">
                                    <option value="none" {{ $mod->decompress_type == 'none' ? 'selected' : '' }}>None</option>
                                    <option value="unzip" {{ $mod->decompress_type == 'unzip' ? 'selected' : '' }}>UNZIP</option>
                                </select>
                            </div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <label for="install" class="form-label">Install Folder</label>
                            <div class="input-group">
                                <span class="input-group-addon">/home/container/</span>
                                <input type="text" name="install" id="install" class="form-control"
                                       placeholder="For example: mods" value="{{$mod->install_folder}}" />
                            </div>
                            <p class="small text-muted no-margin">The mod will be download to this folder.</p>
                        </div>
                        <hr>
                        <button class="btn btn-success" type="button" onclick="addNewLine();" id="line_adder_btn" style="{{ $mod->uninstall_base == 1 ? 'display: none' : '' }}">
                            <i class="fa fa-plus-square"></i> Add New Line
                        </button>
                        <hr>
                        <div class="form-group">
                            <div class="checkbox checkbox-primary no-margin-bottom">
                                <input id="uninstall_base" name="uninstall_base" type="checkbox" {{ $mod->uninstall_base == 1 ? 'checked' : '' }} />
                                <label for="uninstall_base" class="strong">Delete all files from server base folder</label>
                            </div>
                        </div>
                        <div id="lines" style="{{ $mod->uninstall_base == 1 ? 'display: none' : '' }}">
                            <hr>
                            @foreach (unserialize($mod->uninstall_name) as $key => $remove)
                                <div class="row" id="line-{{ $key + 1 }}">
                                    <div class="col-12 col-md-10">
                                        <div class="form-group">
                                            <label for="remove{{ $key + 1 }}" class="form-label">Delete Folder or File</label>
                                            <div class="input-group">
                                                <span class="input-group-addon remove_pre">/home/container/</span>
                                                <input type="text" name="remove{{ $key + 1 }}" id="remove{{ $key + 1 }}" class="form-control"
                                                       placeholder="For example: mymod.jar" value="{{ $remove }}" />
                                            </div>
                                            <p class="small text-muted no-margin">This folder or file will be delete
                                                when
                                                users remove this mod.</p>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-2">
                                        <button class="btn btn-danger btn-block" style="margin-top: 2.4rem;" type="button" onclick="removeLine({{ $key + 1 }});">
                                            <i class="fa fa-trash"></i> Remove Line
                                        </button>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                    <div class="box-footer">
                        {!! csrf_field() !!}
                        <input type="hidden" id="remove_selectors" name="remove_selectors" value="{{ $removes }}">
                        <button class="btn btn-success pull-right" type="submit">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('footer-scripts')
    @parent
    <script>
        $('#egg_ids').select2({
            placeholder: 'Select Eggs',
        });

        function showInstallFolder() {
            let install = $('#install').val();
            install.length > 0 ? install += '/' : install;
            $('.remove_pre').text('/home/container/' + install);
        }

        $('#uninstall_base').change(function() {
            if(this.checked) {
                $('#lines').slideUp(1000);
                $('#line_adder_btn').slideUp(500);
            } else {
                $('#lines').slideDown(1000);
                $('#line_adder_btn').slideDown(500);
            }
        });

        $('#install').on('input', function () {
            showInstallFolder();
        });

        $(document).ready(function () {
            showInstallFolder();
        });

        let lines = [];
        let removes = '{{ $removes }}';

        removes = removes.split(',');

        removes.forEach(item => {
            lines.push(parseInt(item));
        });

        function addNewLine() {
            let next;

            if (lines.length < 1) {
                next = 1;
            } else {
                let last = lines.pop();
                next = last + 1;
                lines.push(last);
            }

            lines.push(next);
            $('#remove_selectors').val(lines);

            $('#lines').append(
                '<div class="row" id="line-' + next + '">\n' +
                '                                <div class="col-12 col-md-10">\n' +
                '                                    <div class="form-group">\n' +
                '                                        <label for="remove' + next + '" class="form-label">Delete Folder or File</label>\n' +
                '                                        <div class="input-group">\n' +
                '                                            <span class="input-group-addon remove_pre">/home/container/</span>\n' +
                '                                            <input type="text" name="remove' + next + '" id="remove' + next + '" class="form-control"\n' +
                '                                                   placeholder="For example: mymod.jar" />\n' +
                '                                        </div>\n' +
                '                                        <p class="small text-muted no-margin">This folder or file will be delete\n' +
                '                                            when\n' +
                '                                            users remove this mod.</p>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                                <div class="col-12 col-md-2">\n' +
                '                                    <button class="btn btn-danger btn-block" style="margin-top: 2.4rem;" type="button" onclick="removeLine(' + next + ');">\n' +
                '                                        <i class="fa fa-trash"></i> Remove Line\n' +
                '                                    </button>\n' +
                '                                </div>\n' +
                '                            </div>'
            );
        }

        function removeLine(id) {
            $('#line-' + id).slideUp(1000, () => {
                $('#line-' + id).remove();
            });

            for (let i = 0; i < lines.length; i++) {
                if (lines[i] === id) {
                    lines.splice(i, 1);
                }
            }

            $('#remove_selectors').val(lines);
        }
    </script>
@endsection
