from os import chdir, system
from sys import argv


def disect_fullfile(fullfile):
    splits = fullfile.replace("\\", "/").split("/")
    dir = "/".join(splits[:-1])
    filename, ext = splits[-1].split(".")
    return {"path": dir, "filename": filename, "ext": ext}


class File:
    def __init__(self, fullfile):
        self.fullfile = fullfile
        self.path, self.filename, self.ext = disect_fullfile(fullfile).values()
        if self.path:
            chdir(self.path)

    def execute(self):
        raise NotImplementedError("You need to subclass 'File'.")


class InterpretedLanguage(File):
    INTERPRETOR = None

    def execute(self):
        command = f"{self.INTERPRETOR} {self.fullfile}"
        system(command)


class Python(InterpretedLanguage):
    INTERPRETOR = "python3"


class Lua(InterpretedLanguage):
    INTERPRETOR = "lua"


class C(File):
    def execute(self):
        system(f"gcc {self.fullfile} -o {self.path}/a.out")
        system("./a.out")


class Files:
    EXTS = {"py": Python, "lua": Lua, "c": C}

    @staticmethod
    def get_obj(fullfile):
        ext = disect_fullfile(fullfile)["ext"]
        return Files.EXTS.get(ext, InterpretedLanguage)(fullfile)


if __name__ == "__main__":
    cls = Files.get_obj(argv[1]).execute()
