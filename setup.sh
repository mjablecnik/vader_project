new_project_name=$1

if [ -z "$new_project_name" ]; then
    echo "Error: Project name not provided."
    echo "Usage: ./setup.sh <new_project_name>"
    exit 1
fi

mv project_app ${new_project_name}_app
mv project_design ${new_project_name}_design

mv ${new_project_name}_design/src/project_design ${new_project_name}_design/src/${new_project_name}_design
mv ${new_project_name}_design/src/project_design_exports ${new_project_name}_design/src/${new_project_name}_design_exports

rm -rf ${new_project_name}_app/{build,.dart_tool,.idea}
rm -rf ${new_project_name}_design/{build,.dart_tool,.idea}
rm -rf .idea

replace project_app ${new_project_name}_app
replace project_design ${new_project_name}_design
