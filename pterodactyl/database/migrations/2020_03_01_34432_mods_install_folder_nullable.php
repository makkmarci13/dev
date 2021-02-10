<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ModsInstallFolderNullable extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('mods', function (Blueprint $table) {
            $table->text('install_folder')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down()
    {
        Schema::table('mods', function (Blueprint $table) {
        });
    }
}
