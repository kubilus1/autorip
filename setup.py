from setuptools import setup

setup(
    name='ripweb',
    version='1.0',
    long_description=__doc__,
    packages=['.'],
    scripts=['ripweb.py'],
    include_package_data=True,
    zip_safe=False,
    install_requires=['Flask', 'ansi2html']
)
