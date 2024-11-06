def read_packages(filename):
    with open(filename, 'r') as f:
        return set(line.strip() for line in f if line.strip())


def filter_pkgs(all_pkgs, *pkg_files):
    all_pkgs_set = set(read_packages(all_pkgs))
    excluded_pkgs = set()
    for filename in pkg_files:
        excluded_pkgs.update(read_packages(filename))
    return all_pkgs_set - excluded_pkgs


def save_pkgs(pkgs, filename):
    with open(filename, 'w') as file:
        file.truncate(0)  # Wipe the file content first
        for pkg in sorted(pkgs):
            file.write(pkg + '\n')


# Read all package lists
all_pkgs = "pkgs/all_pkgs"
nvidia_pkgs = "pkgs/nvidia_pkgs"
kvm_pkgs = "pkgs/kvm_pkgs"
kde_pkgs = "pkgs/kde_pkgs"
devops_pkgs = "pkgs/devops_pkgs"
node_pkgs = "pkgs/node_pkgs"
java_pkgs = "pkgs/java_pkgs"
docker_pkgs = "pkgs/docker_pkgs"
dotnet_pkgs = "pkgs/dotnet_pkgs"
browsers_pkgs = "pkgs/browsers_pkgs"
filemanagers_pkgs = "pkgs/filemanagers_pkgs"
monitors_pkgs = "pkgs/monitors_pkgs"
terminal_pkgs = "pkgs/terminal_pkgs"
IDEs_pkgs = "pkgs/IDEs_pkgs"
telecom_pkgs = "pkgs/telecom_pkgs"
theme_pkgs = "pkgs/theme_pkgs"
hyprland_pkgs = "pkgs/hyprland_pkgs"


# Remove packages from all_pkgs.
filtered_pkgs = filter_pkgs(all_pkgs, nvidia_pkgs, kvm_pkgs, kde_pkgs,
                            devops_pkgs, node_pkgs, java_pkgs, docker_pkgs,
                            dotnet_pkgs, browsers_pkgs, filemanagers_pkgs,
                            monitors_pkgs, terminal_pkgs, IDEs_pkgs,
                            telecom_pkgs, theme_pkgs, hyprland_pkgs)

# Save the remaining packages to all_pkgs.
save_pkgs(filtered_pkgs, all_pkgs)
