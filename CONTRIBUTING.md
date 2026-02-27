# Contributing to NAAb Passage

Thank you for your interest in contributing to NAAb Passage!

## Development Setup

```bash
# Clone repository
git clone --recursive https://github.com/b-macker/naab-passage.git
cd naab-passage

# Build NAAb
bash build.sh

# Run tests
./naab/build/naab-lang verify_vigilant_v7.naab
```

## Code Style

- Follow existing code patterns in `.naab` files
- Use clear, descriptive variable names
- Add comments for complex logic
- Keep functions focused and single-purpose

## Pull Request Process

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Make** your changes
4. **Test** thoroughly (run test suite)
5. **Commit** with descriptive messages
6. **Push** to your fork
7. **Open** a Pull Request with:
   - Clear description of changes
   - Motivation for the change
   - Test results

## Commit Messages

Use clear, present-tense commit messages:

```
Add SSN detection for European formats
Fix race condition in gateway startup
Update documentation for risk matrix
```

## Testing

All contributions must include tests. Run the test suite before submitting:

```bash
./naab/build/naab-lang verify_vigilant_v7.naab
```

For new features, add test cases to `verify_vigilant_v7.naab` or create new test files.

## Documentation

Update documentation when adding features:
- README.md for user-facing changes
- Code comments for implementation details
- docs/ for detailed guides

## Questions?

Open an issue for discussion before starting major work. We're happy to help!

## Code of Conduct

This project adheres to the Contributor Covenant [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.
