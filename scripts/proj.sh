function proj() {
    # Define your project directories
    local projects=(
        ~/development
        ~/workspace
        ~/code
    )
    
    # Use fzf to select project
    local selected=$(find "${projects[@]}" -maxdepth 2 -type d | fzf)
    
    if [[ -n "$selected" ]]; then
        cd "$selected"
        # Automatically set up development environment
        if [[ -f package.json ]]; then
            echo "Node project detected"
            nvm use
            yarn install
        elif [[ -f Gemfile ]]; then
            echo "Ruby project detected"
            bundle install
        fi
    fi
}
